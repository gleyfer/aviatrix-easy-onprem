# Aviatrix-Easy-Onprem

This is a wrapper around the ![aviatrix-demo-onprem](https://github.com/gleyfer/aviatrix-demo-onprem) module which allows the creation of the following topology with one line:

![Topology](aviatrix-demo-onprem-Topology.png)

# Instructions

Please modify the terraform.tfvars and configure the AWS provider and Aviatrix provider credentials. There are additional options which you can configure for the aviatrix-demo-onprem module which are commented out and you can uncomment and adjust as needed.

Example of quickly deploying the topology with a test client and creating external conns over public IP to two Aviatrix gateways:

```bash
terraform plan -var public_conns='["Test-Transit:64525:1"]' -var create_client=true
```

Example with multiple private external connections (E.g., DX):

```bash
terraform plan -var private_conns='["Test-Transit:64525:1", "TestWest-Transit:64526:1"]' -var create_client=true
```

You can mix and match and specify both public_conns and private_conns.

Format:

```terraform
["gatway-name:gateway-bgp-as-num:num_tunnels", "second-gw-name:second-gw-bgp-as-num:num_tunnels", ...]
```
**NOTE:** Currently, num_tunnels can only be set to 1. This is reserved for future use with multi-vrf use-cases.

Defaults:

**vpc_cidr:** 172.16.0.0/16
**public_sub:** 172.16.0.0/24
**private_sub:** 172.16.1.0/24
**hostname:** onprem-csr
**instance_type:** t2.medium
**csr_bgp_as_num:** 64527
**create_client:** false

You can override the defaults either as specifying them as a var on the command line (e.g., -var vpc_cidr="10.100.0.0/16") or modifying the terraform.tfvars

Explanation of arguments:

- **hostname:** The hostname which will be configured on the CSR and which will prefix all of the resources created.
- **vpc_cidr:** The VPC CIDR block to use when creating the VPC which the CSR will reside in.
- **public_sub:** The public subnet for the CSR public facing interface.
- **private_sub:** The private subnet for the CSR private facing interface. If enabled, the test client will be created in this subnet.
- **instance_type (optional):** The instance type to launch the CSR with. Default is t2.medium
- **public_conns:** List of public external connection definitions (please see above example for format). Tunnels will be created to primary and hagw automatically.
- **private_conns:** List of private external connection definitions (For DX, please see above example for format). Tunnels will be created to primary and hagw automatically.
- **csr_bgp_as_num:** BGP AS Number to use on the CSR.
- **create_client (optional):** If enabled, creates an amazon linux instance in the private subnet, configures public SG to allow port 2222 and configures a port forward on the CSR to allow SSH into the test instance using the CSR EIP and port 2222. SSH Key used for the instance will either be the one specified in key_name or generated automatically. Disabled by default.

Outputs:

- **CSR_Public_IP:** Public EIP of CSR instance
- **CSR_SSH_Cmd:** SSH Command to directly access the CSR
- **Client_SSH_Cmd:** SSH Command to access the test client

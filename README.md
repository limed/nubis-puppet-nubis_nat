# nubis_nat

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage - Configuration options and additional functionality](#usage)

## Overview

Creates a NAT instance in AWS

## Module Description

Sets up an AWS NAT Instance using Iptables 

## Usage

```bash
class { 'nubis_nat':
    nat_interface     => 'eth0',
    disable_interface => 'eth1',
}
```

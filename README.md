# reflex-aws-role-permissions-boundary-changed-or-deleted
A Reflex Rule for detecting the modification or deletion of an IAM Role permission boundary.

Note: This rule does _not_ detect the modification of permissions of an IAM Policy that is
actively being used as a permission boundary. It detects when an IAM Policy is attached
to a Role as a Permissions Boundary, or when a Permissions Boundary is removed from a Role.

## Usage
To use this rule either add it to your `reflex.yaml` configuration file:  
```
rules:
  - reflex-aws-role-permissions-boundary-changed-or-deleted:
      version: latest
```

or add it directly to your Terraform:  
```
...

module "reflex-aws-role-permissions-boundary-changed-or-deleted" {
  source           = "github.com/cloudmitigator/reflex-aws-role-permissions-boundary-changed-or-deleted"
}

...
```

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/cloudmitigator/reflex-aws-role-permissions-boundary-changed-or-deleted/blob/master/LICENSE) 

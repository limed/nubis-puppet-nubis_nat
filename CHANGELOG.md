# Change Log

## [v1.2.3](https://github.com/nubisproject/nubis-puppet-nat/tree/v1.2.3) (2017-10-04)
[Full Changelog](https://github.com/nubisproject/nubis-puppet-nat/compare/v1.2.2...v1.2.3)

**Closed issues:**

- Tag new release v1.3.0 [\#26](https://github.com/nubisproject/nubis-puppet-nat/issues/26)
- Tag v1.2.3 release [\#40](https://github.com/nubisproject/nubis-puppet-nat/issues/40)
- Tag v1.2.3 release [\#32](https://github.com/nubisproject/nubis-puppet-nat/issues/32)
- Tag v1.2.3 release [\#30](https://github.com/nubisproject/nubis-puppet-nat/issues/30)

**Merged pull requests:**

- Merge v1.2.3 release into develop. \[skip ci\] [\#42](https://github.com/nubisproject/nubis-puppet-nat/pull/42) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.2.3 release \[skip ci\] [\#41](https://github.com/nubisproject/nubis-puppet-nat/pull/41) ([tinnightcap](https://github.com/tinnightcap))
- Readme lint fixes [\#39](https://github.com/nubisproject/nubis-puppet-nat/pull/39) ([limed](https://github.com/limed))
- supervisord shellcheck fixes [\#38](https://github.com/nubisproject/nubis-puppet-nat/pull/38) ([limed](https://github.com/limed))
- Nat script fix [\#37](https://github.com/nubisproject/nubis-puppet-nat/pull/37) ([limed](https://github.com/limed))
- Fixing up shellcheck failures [\#36](https://github.com/nubisproject/nubis-puppet-nat/pull/36) ([limed](https://github.com/limed))
- Feature/arena [\#35](https://github.com/nubisproject/nubis-puppet-nat/pull/35) ([gozer](https://github.com/gozer))
- Merge v1.2.3 release into develop. \[skip ci\] [\#34](https://github.com/nubisproject/nubis-puppet-nat/pull/34) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.2.3 release \[skip ci\] [\#33](https://github.com/nubisproject/nubis-puppet-nat/pull/33) ([tinnightcap](https://github.com/tinnightcap))
- Update CHANGELOG for v1.2.2 relase [\#28](https://github.com/nubisproject/nubis-puppet-nat/pull/28) ([limed](https://github.com/limed))

## [v1.2.2](https://github.com/nubisproject/nubis-puppet-nat/tree/v1.2.2) (2016-08-02)
[Full Changelog](https://github.com/nubisproject/nubis-puppet-nat/compare/v1.2.1...v1.2.2)

**Fixed bugs:**

- Disable sourcedest check [\#25](https://github.com/nubisproject/nubis-puppet-nat/issues/25)

**Closed issues:**

- Tag new release v1.2.2 [\#29](https://github.com/nubisproject/nubis-puppet-nat/issues/29)

**Merged pull requests:**

- Check if sourcedest is enabled or not [\#27](https://github.com/nubisproject/nubis-puppet-nat/pull/27) ([limed](https://github.com/limed))

## [v1.2.1](https://github.com/nubisproject/nubis-puppet-nat/tree/v1.2.1) (2016-07-30)
[Full Changelog](https://github.com/nubisproject/nubis-puppet-nat/compare/v1.2.0...v1.2.1)

**Closed issues:**

- Tag v1.2.1 release [\#23](https://github.com/nubisproject/nubis-puppet-nat/issues/23)

**Merged pull requests:**

- Update CHANGELOG for v1.2.1 release [\#24](https://github.com/nubisproject/nubis-puppet-nat/pull/24) ([tinnightcap](https://github.com/tinnightcap))

## [v1.2.0](https://github.com/nubisproject/nubis-puppet-nat/tree/v1.2.0) (2016-07-07)
[Full Changelog](https://github.com/nubisproject/nubis-puppet-nat/compare/v1.1.0...v1.2.0)

**Implemented enhancements:**

- Cleanup nat script to remove additional cruft [\#8](https://github.com/nubisproject/nubis-puppet-nat/issues/8)
- Implement HA nat [\#18](https://github.com/nubisproject/nubis-puppet-nat/issues/18)

**Closed issues:**

- Fix incorrect filters using Name=tag-value [\#1](https://github.com/nubisproject/nubis-puppet-nat/issues/1)
- Tag v1.2.0 release [\#21](https://github.com/nubisproject/nubis-puppet-nat/issues/21)

**Merged pull requests:**

- Update CHANGELOG for v1.2.0 release [\#22](https://github.com/nubisproject/nubis-puppet-nat/pull/22) ([tinnightcap](https://github.com/tinnightcap))
- HA NAT scripts [\#20](https://github.com/nubisproject/nubis-puppet-nat/pull/20) ([limed](https://github.com/limed))

## [v1.1.0](https://github.com/nubisproject/nubis-puppet-nat/tree/v1.1.0) (2016-04-18)
**Implemented enhancements:**

- Update puppet module metadata [\#11](https://github.com/nubisproject/nubis-puppet-nat/issues/11)
- Prepare ourselves for only one active NAT instance at time [\#15](https://github.com/nubisproject/nubis-puppet-nat/issues/15)

**Fixed bugs:**

- Disable rp\_filter \(reverse path filter\) on nat instance [\#10](https://github.com/nubisproject/nubis-puppet-nat/issues/10)

**Closed issues:**

- Create route if missing [\#6](https://github.com/nubisproject/nubis-puppet-nat/issues/6)
- Only modify the subnet's route tables if it's not already defaulting to our acquired ENI [\#4](https://github.com/nubisproject/nubis-puppet-nat/issues/4)
- Default startup order to the correct, even if strange '0-3', as in base [\#2](https://github.com/nubisproject/nubis-puppet-nat/issues/2)

**Merged pull requests:**

- Update CHANGELOG for v1.1.0 release [\#17](https://github.com/nubisproject/nubis-puppet-nat/pull/17) ([tinnightcap](https://github.com/tinnightcap))
- Load sysctl from a file [\#14](https://github.com/nubisproject/nubis-puppet-nat/pull/14) ([limed](https://github.com/limed))
- Fixing metadata to point to new org [\#13](https://github.com/nubisproject/nubis-puppet-nat/pull/13) ([limed](https://github.com/limed))
- Disable rp\_filter option [\#12](https://github.com/nubisproject/nubis-puppet-nat/pull/12) ([limed](https://github.com/limed))
- Handle the case where there is no default route at all [\#7](https://github.com/nubisproject/nubis-puppet-nat/pull/7) ([gozer](https://github.com/gozer))
- Only set our ENI as the default route for our subnets if not already [\#5](https://github.com/nubisproject/nubis-puppet-nat/pull/5) ([gozer](https://github.com/gozer))
- Fix ordering to be 0-3, like shown working in base [\#3](https://github.com/nubisproject/nubis-puppet-nat/pull/3) ([gozer](https://github.com/gozer))
-  Backwards-incompatible change: Make the current NAT route all traffic for all private subnets [\#16](https://github.com/nubisproject/nubis-puppet-nat/pull/16) ([gozer](https://github.com/gozer))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
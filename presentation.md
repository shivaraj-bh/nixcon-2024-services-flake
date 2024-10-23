---
title: services-flake
sub_title: Services simplified for Dev/CI workflows
author: shivaraj-bh
theme:
  override:
   footer:
     style: template
     left: "github:shivaraj-bh/nixcon-2024-services-flake"
     right: "{current_slide} / {total_slides}"
---

Motivation
---

# Project-specific services
<!-- pause -->
# Support for `macOS` and `Linux`
<!-- pause -->
# Services as flake `apps`
<!-- pause -->
# Share service configurations
<!-- pause -->

> `services-flake` is part of a decentralised ecosystem of `flake-parts` modules, bringing `NixOS-like services` to `Nix flakes` with a `process-compose` backend.

<!-- end_slide -->

Other Niceties
---

# Multile instances of each service
<!-- pause -->
# Usage without `flake-parts` [](https://community.flake.parts/services-flake/without-flake-parts)

<!-- pause -->

```nix
{
  packages.redis = pc-flake.lib.makeProcessCompose {
    modules = [
      services-flake.processComposeModules.default
      {
        services.redis."r1".enable = true;
      }
    ];
  };
}
```
<!-- end_slide -->

CI/Dev Workflow Demo
---

# Using [](https://github.com/juspay/todo-app) for demo
## `todo-app` is written in Haskell and depends on `PostgREST` and `PostgreSQL`.

<!-- pause -->
How To...
---
> Pause and reflect before we dive into the demo
# Configure the development environment with services?
<!-- pause -->
# Write integration tests sharing service config with development environment?
<!-- pause -->
# Avoid binding to TCP ports?

<!-- end_slide -->

Other Usage Examples
---

# Nammayatri - OSS alternative to Uber in India
## [](https://nixos.asia/en/blog/replacing-docker-compose)
<!-- pause -->
# Hyperswitch - OSS payments switch, soon adopting `services-flake`
## [](https://github.com/juspay/hyperswitch/pull/6377)

<!-- end_slide -->

Credits
---
# Thanks to all the contributors!
![image:width:70%](contributors.png)
<!-- pause -->
# Thanks to the `devenv` project, which originally inspired this project

<!-- end_slide -->

Future Scope
---
> If you wish to collaborate on any of these, hit me up on the hack day
# Portable service layer (Issue _#354_)
# Lock on data directory (Issue _#312_)
# Simplify usage for single-instance services (Issue _#260_)


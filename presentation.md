---
title: services-flake
sub_title: Services simplified for Dev/CI workflows
author: shivaraj-bh
---

What `services-flake` does and why?
---

`services-flake` brings NixOS-like services to `Nix flakes` as runnable `apps` with `process-compose` backend.

Motivation
---

* Project specific services
* Support `macOS` and `Linux`

<!-- end_slide -->

Other Niceties
---

* Multile instances of each service
* Reusable configurations

We use `flake-parts` by default, but `services-flake` works standalone too:
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
For details, see [](https://community.flake.parts/services-flake/without-flake-parts)

<!-- end_slide -->

Demo
---

Now we will see how CI/development workflows look in a project using services-flake (on macOS and Linux _[^1]_): [](https://github.com/juspay/todo-app)

<!-- new_lines: 17 -->
> _[^1]_: If you are curious about how I share same configuration across macOS and NixOS, see [](https://github.com/juspay/nixos-unified-template)

<!-- end_slide -->

Best practices
---

* Use the reserved `test` process to run integration test with auto-wired flake check.
* Use `Unix socket` for development -- removing any dependency on a global state.

<!-- end_slide -->

Future Scope
---

# Portable service layer (Issue _#354_)
# Lock on data directory (Issue _#312_)
# Simplify usage for single-instance services (Issue _#260_):

```nix
{
  services.redis."r1".enable = true;
  # can be simplified for single-instance service:
  services.redis.enable = true;
}
```

<!-- end_slide -->

Other Usage Examples
---

* Nammayatri (OSS alternative for Uber in India) uses `services-flake`, see [](https://nixos.asia/en/blog/replacing-docker-compose)
* Hyperswitch (OSS payments switch) will soon adopt `services-flake`, see [](https://github.com/juspay/hyperswitch/pull/6377)


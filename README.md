Container image for Codex - Lightweight coding agent that runs in your terminal

## Usage

### Start session

```shell
docker run --rm -it --privileged --volume=$(pwd):/workspace --volume=~/.codex:/root/.codex ghcr.io/r-xs-fi/codex 
```

Outputs:
```console
╭─────────────────────────────────────────────╮
│ >_ OpenAI Codex (v0.110.0)                  │
│                                             │
│ model:     gpt-5.3-codex   /model to change │
│ directory: /workspace                       │
╰─────────────────────────────────────────────╯
```

## Supported platforms


| OS    | Architecture  | Supported | Example hardware |
|-------|---------------|-----------|-------------|
| Linux | amd64 | ✅       | Regular PCs (also known as x64-64) |
| Linux | arm64 | ✅       | Raspberry Pi with 64-bit OS, other single-board computers, Apple M1 etc. |
| Linux | arm/v7 | ❌ (Upstream prebuild executable not available.)       | Raspberry Pi with 32-bit OS, older phones |
| Linux | riscv64 | ❌ (Upstream prebuild executable not available.)       | More exotic hardware |

## How does this software get to me?

```mermaid
flowchart TD
    subgraph "Origin"
        sourcerepo["Original source repo"]
        author_builds["Author builds the NPM package"]
    end
    subgraph "NPM registry"
        NPM_package[Package: @openai/codex 🔗]

        click NPM_package "https://www.npmjs.com/package/@openai/codex"
    end
    subgraph "Packaging build"
        rxsfi_build["r.xs.fi build (GitHub Actions)"]
    end
    subgraph "Container Registry"
        r_xs_fi_package_registry[ghcr.io/r-xs-fi/codex 🔗]

        click r_xs_fi_package_registry "https://ghcr.io/r-xs-fi/codex"
    end
    subgraph "user"
        docker_run[$ docker run ...]
    end
    sourcerepo -- used by --> author_builds -- upload --> NPM_package
    NPM_package -- download --> rxsfi_build
    rxsfi_build -- push --> r_xs_fi_package_registry
    r_xs_fi_package_registry -- pull --> docker_run[$ docker run ...]

```

# Kubernetes controller proof provenance

`TECHNE-OPS-007` began here as a dependency-free proof for one retained, single-node K3s controller cluster plus zero or more independently registered execution clusters.

The executable implementation moved to [`knowledgeislands/ki-techne-tools`](https://github.com/knowledgeislands/ki-techne-tools) at commit `3e33c4e980a59e219dfb31d9b937d7bb4c3691bf`. Its detailed path mapping and intentional migration changes are recorded in the [migration provenance](https://github.com/knowledgeislands/ki-techne-tools/blob/main/docs/provenance/TECHNE-OPS-007.md), and current operating instructions are in the [controller proof guide](https://github.com/knowledgeislands/ki-techne-tools/blob/main/docs/guides/controller-proof.md).

The source baseline was Techne Principal commit `51b780f6574be61728f4bb0258d9d17b0a3974bc`; its final proof-source commit was `ef758bf3c746f03afaf401dca570967ee9a89e6f`. On 19 September 2026, the migrated controller package was re-uploaded to retained instance `i-09b1ed39bc4735eda` in AWS account `655383751458`, region `eu-west-1`. The remote controller source reported SHA-256 `4efbca43184429c22265de6f0cb255c2437667f8599dfe555742752020a2f5c5`, matching the migrated source, while K3s reported Secret encryption enabled at `reencrypt_finished` with matching server hashes.

Only sanitised live-proof evidence belongs in [`results/`](results/). Credentials, raw Telegram updates, numeric operator identifiers, kubeconfigs, bearer tokens and AWS session material must never be retained here.

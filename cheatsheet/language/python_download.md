# python download module

- pypi
  - `pypi_x86_64_windows`
  - `pypi_x86_64_ubuntu2004`
  - `pypi_x86_64_ubuntu2204`
  - `pypi_x86_64_ubuntu2404`
    - py39
    - py310
    - py311
      - torch
        - torch_2.5.1_rocm6.1
        - torch_2.5.1_rocm6.2
        - torch_2.5.1_cu118
        - torch_2.5.1_cu121
        - torch_2.5.1_cu124
        - torch_2.5.1_cpu
        - torch_2.6.0_cu118
        - torch_2.6.0_cu124
        - torch_2.6.0_cu126
    - py312
    - py313

```sh
downpy.sh lz4 zstandard protobuf python-dotenv
downpy.sh websockets jupyterlab minio hera "fastapi[standard]" uvicorn confluent_kafka kafka-python-ng Flask aiohttp
downpy.sh mcap foxglove-schemas-protobuf mcap-protobuf-support deltalake av pillow
downpy.sh numpy pandas matplotlib tensorflow scikit-learn transformers tf-keras ipykernel polars scipy plotly

downpy.sh torch==2.0.0 torchvision==0.15.1 torchaudio==2.0.1
downpy.sh torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2
downpy.sh torch==2.1.2 torchvision==0.16.2 torchaudio==2.1.2
downpy.sh torch==2.2.2 torchvision==0.17.2 torchaudio==2.2.2
downpy.sh torch==2.3.1 torchvision==0.18.1 torchaudio==2.3.1
downpy.sh torch==2.4.1 torchvision==0.19.1 torchaudio==2.4.1
downpy.sh torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1
downpy.sh torch==2.6.9 torchvision==0.21.0 torchaudio==2.6.0
```

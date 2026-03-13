from prophecy_pipeline_sdk.graph import *
from prophecy_pipeline_sdk.properties import *
args = PipelineArgs(label = "test_pipeline_2", version = 1, auto_layout = False)

with Pipeline(args) as pipeline:
    test_pipeline_2__customer_orders = Process(
        name = "test_pipeline_2__customer_orders",
        properties = ModelTransform(modelName = "test_pipeline_2__customer_orders"),
        input_ports = ["in_0", "in_1"]
    )


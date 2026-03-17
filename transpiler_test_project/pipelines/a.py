from prophecy_pipeline_sdk.graph import *
from prophecy_pipeline_sdk.properties import *
args = PipelineArgs(label = "a", version = 1, auto_layout = False)

with Pipeline(args) as pipeline:
    a__order_id_integer_bigquery = Process(
        name = "a__order_id_integer_bigquery",
        properties = ModelTransform(modelName = "a__order_id_integer_bigquery"),
        input_ports = ["in_0", "in_1"]
    )


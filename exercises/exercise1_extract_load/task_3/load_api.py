import dlt
import requests


@dlt.resource(write_disposition="replace")
def parking_resource(api_key: str):
    url = "https://openparking.stockholm.se/LTF-Tolken/v1/pmotorcykel/all"

    params = {
        "outputFormat": "json",
        "maxFeatures": 100,
        "apiKey": api_key,
    }

    response = requests.get(url, params=params, timeout=30)
    response.raise_for_status()

    data = response.json()

    print("API response received")
    print("Number of features:", len(data["features"]))

    yield from data["features"]


if __name__ == "__main__":
    api_key = dlt.secrets["sources.parking_api.api_key"]

    data = parking_resource(api_key)

    pipeline = dlt.pipeline(
        pipeline_name="parking",
        destination="snowflake",
        dataset_name="staging",
    )

    load_info = pipeline.run(
        data,
        table_name="motorcycle_parking",
    )

    print(load_info)
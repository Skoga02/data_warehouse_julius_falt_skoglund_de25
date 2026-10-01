import os
print("USER:", repr(os.getenv("SNOWFLAKE_USER")))
print("PASSWORD set:", os.getenv("SNOWFLAKE_PASSWORD") is not None)
print("ACCOUNT:", repr(os.getenv("SNOWFLAKE_ACCOUNT")))
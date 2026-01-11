from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    PROJECT_NAME: str = "gwanak-ml-api"
    MODEL_PATH: str = "app/models/business.pkl"
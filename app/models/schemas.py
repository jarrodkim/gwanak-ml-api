from pydantic import BaseModel

class PredictionRequest(BaseModel):
    dong_name: str  # 관악구 행정동 명칭 (예: 대학동, 낙성대동)
    category: str   # 업종 (예: 카페, 음식점)

class PredictionResponse(BaseModel):
    region: str
    prediction_type: str
    result: float
from fastapi import APIRouter
from app.models.schemas import PredictionRequest, PredictionResponse

router = APIRouter()

@router.post("/predict/sales", response_model=PredictionResponse)
async def predict_sales(request: PredictionRequest):
    # 관악구 상권 데이터를 기반으로 한 매출 예측 시뮬레이션
    # 추후 ml_manager를 통해 실제 모델 추론 로직 연결
    return {
        "region": request.dong_name,
        "prediction_type": "sales",
        "result": 5500000  # 예시 금액
    }
from django.urls import path
from companyapi import views
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.routers import DefaultRouter

router=DefaultRouter()
router.register("job",views.JobView,basename="manage_job"),
router.register("applications",views.ApplicationView,basename="applications"),
router.register("scheduledinterview",views.InterviewSheduleView,basename="scheduledinterview"),



urlpatterns=[
    path("signup/",views.CompanyCreationView.as_view(),name="signup"),
    path('token/',views.CustomAuthToken.as_view(), name='token'),


] +router.urls
from rest_framework import serializers
from Tpoapi.models import TPO,Student,Company,Materials,Job,Application,InterviewSchedule,Questions


class TpoSerializer(serializers.ModelSerializer):
    id=serializers.CharField(read_only=True)
    password=serializers.CharField(write_only=True)

    class Meta:
        model=TPO
        fields=["id","name","phone_no","email_address","username","password"]


    def create(self,validated_data):
        return TPO.objects.create_user(**validated_data)


class StudentSerializer(serializers.ModelSerializer):
    id=serializers.CharField(read_only=True)
    password=serializers.CharField(write_only=True)

    class Meta:
        model=Student
        fields=["id","First_name","Last_name","phone_no","email_address","username","password"]


    def create(self, validated_data):
        return Student.objects.create_user(**validated_data)     


class  CompanySerializer(serializers.ModelSerializer):
    id=serializers.CharField(read_only=True)
    password=serializers.CharField(write_only=True)

    class Meta:
        model=Company
        fields=["id","name","description","industry","email_address","phone_no","Headquarters","founded","logo","website","username","password"]        


class MaterialSerializer(serializers.ModelSerializer):
    class Meta:
        model=Materials
        fields="__all__" 
    

class JobSerializer(serializers.ModelSerializer):
    posted_by=serializers.CharField(read_only=True)
    class Meta:
        model=Job
        fields="__all__" 
        
        
class ApplicationSerializer(serializers.ModelSerializer):
    student=StudentSerializer()
    job=JobSerializer()
    class Meta:
        model=Application
        fields="__all__"



class InterviewSheduleSerializer(serializers.ModelSerializer):
    company=CompanySerializer()
    application=ApplicationSerializer()
    class Meta:
        model=InterviewSchedule
        fields="__all__" 
        
        
class QuestionsSerializer(serializers.ModelSerializer):
    class Meta:
        model=Questions
        fields="__all__" 
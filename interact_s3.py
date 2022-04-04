import boto3
import pandas as pd

#Criar cliente para interagir com AWS S3

s3_client = boto3.client('s3', region_name='us-east-2')

s3_client.download_file("bu-igti-edc",
                        "data/infracoes2021completonovo.csv",
                        "data/CTTU2021.csv")

df = pd.read_csv('data/CTTU2021.csv',on_bad_lines='skip', sep=";")
print(df)

s3_client.upload_file("data/infracoes2020completo.csv",
                       "bu-igti-edc",
                       "data/CTTU2020.csv"
                    )
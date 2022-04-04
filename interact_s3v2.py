import boto3
import pandas as pd

#Criar cliente para interagir com AWS S3

s3_client = boto3.client('s3', region_name='us-east-2')

df = pd.read_csv('data/CTTU.csv',on_bad_lines='skip', sep=";",skiprows = 1,header = None)
df.to_csv('data/CTTU2020.csv', sep='|',  encoding='utf-8')
print(df)

s3_client.upload_file("data/CTTU2020.csv",
                       "bu-igti-edc",
                       "data/CTTU2020v2.csv"
                    )

df2 = pd.read_csv('data/CTTU2020.csv',on_bad_lines='skip', sep="|")
print(df2)
import pandas as pd
import json
import ast
import numpy as np

file_path = '/Users/albertolupatin/Desktop/Genomics/Project/checkm_output/storage/bin_stats_ext.tsv'
df = pd.read_csv(file_path, sep='\t', header=None)


original_column_names = df.iloc[0]
df.columns = ['sample', 'info']

new_row = pd.DataFrame([original_column_names.values], columns=['sample', 'info'])
df = pd.concat([new_row, df], ignore_index=True)
df = df.drop(0).reset_index(drop=True)

df.iloc[:, 1] = df.iloc[:, 1].apply(lambda x: x.replace("'", '"'))
df.iloc[:, 1] = df.iloc[:, 1].apply(lambda x: json.loads(x))

df['Completeness'] = df.iloc[:, 1].apply(lambda x: x.get('Completeness'))
df['Contamination'] = df.iloc[:, 1].apply(lambda x: x.get('Contamination'))

df2 = df[['Completeness', 'Contamination']]
print(type(df2))

df2.to_csv("/Users/albertolupatin/Desktop/Genomics/Project/Com_Con.csv")

#print(df[['Completeness', 'Contamination']])
#print(df2)

#print("MEAN of Completeness: ", df.loc[:, 'Completeness'].mean())
#print("MEAN of Contamination: ",df.loc[:, 'Contamination'].mean())
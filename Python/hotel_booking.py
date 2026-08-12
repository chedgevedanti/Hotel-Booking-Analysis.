import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
data = pd.read_csv("hotel_booking _cleaned data.csv")
#creating dataframe
df = pd.DataFrame(data)
print(df)

#top 10
print(df.head(10))

#info
print(df.info())

#describe 
print(df.describe())

#Outlier detection
#adr outlier detection
plt.figure(figsize=(8,5))
sns.boxplot( x = df['adr'])
plt.title("ADR Outlier")
plt.savefig("adr_outlier.png")
plt.show()

#adult outlier
plt.figure(figsize=(8,5))
sns.boxplot(x = df['adults'])
plt.title("Adult Outlier")
plt.savefig("Adult_Outlier.png")
plt.show()

#lead time distribution
plt.figure(figsize=(8,5))
sns.histplot(df['lead_time'],bins=10,kde=True)
plt.title("Lead Time Distribution")
plt.savefig("Lead_Time_Distribution.png")
plt.show()

#correlation analysis
numeric_df = df.select_dtypes(include="number")
correlation_matrix =numeric_df.corr()
plt.figure(figsize=(14,10))
sns.heatmap(correlation_matrix,annot=True,cmap='coolwarm',fmt=".2f")
plt.title("Correlation Heatmap")
plt.savefig("correlation_heatmap.png")
plt.show()
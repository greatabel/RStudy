import requests
from bs4 import BeautifulSoup
import os
#  Gutenberg的公共领域图书链接
# urls = [
#     'http://www.gutenberg.org/cache/epub/1524/pg1524.html',  # Hamlet by William Shakespeare
#     'https://www.gutenberg.org/files/1342/1342-h/1342-h.htm',  # Pride and Prejudice    
#     'https://www.gutenberg.org/files/2600/2600-h/2600-h.htm'  # War and Peace
# ]

# for index, url in enumerate(urls):
#     # 请求页面
#     response = requests.get(url)
#     response.encoding = 'utf-8'  # 确保正确的编码

#     # 使用BeautifulSoup解析页面
#     soup = BeautifulSoup(response.text, 'html.parser')

#     # 找到书籍正文
#     text = soup.find_all('p')  # 在这些网页中，文本被包含在<p>标签中

#     # 创建一个文件来保存文本
#     with open(f'book_{index + 1}.txt', 'w', encoding='utf-8') as file:
#         for paragraph in text:
#             file.write(paragraph.get_text() + '\n')  # 将每段文本写入文件并添加换行符






# 检查 'docs' 文件夹是否存在，如果不存在则创建
if not os.path.exists('docs'):
    os.makedirs('docs')

# 需要处理的文件列表
file_names = ['book_1.txt', 'book_2.txt', 'book_3.txt']

# 每份文件的长度
length = 2500

# 每个原始文件生成的文件数量
num_files = 6

for file_name in file_names:
    with open('original_books/'+file_name, 'r', encoding='utf-8') as file:
        text = file.read()

    # 获取前2500字的内容
    text = text[:length * num_files]

    # 将内容分割成500字的多个部分
    chunks = [text[i:i+length] for i in range(0, len(text), length)]

    # 创建一个新的文件名的前缀，删除.txt扩展名
    new_file_prefix = file_name[:-4]

    # 将每个分割后的部分写入新的文件
    for index, chunk in enumerate(chunks):
        new_file_name = f'docs/{new_file_prefix}_{index + 1}.txt'

        with open(new_file_name, 'w', encoding='utf-8') as new_file:
            new_file.write(chunk)


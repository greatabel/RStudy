import matplotlib.pyplot as plt
import numpy as np


def total_count_compare():
    # 用来正常显示负号
    plt.rcParams['axes.unicode_minus']=False

    # 指定分组个数
    n_bins=1

    fig,ax=plt.subplots(figsize=(8,5))

    # 分别生成10000 ， 5000 ， 2000 个值
    # x_multi = [np.random.randn(n) for n in [10000, 5000]]
    x_multi = [[65034310, 65034310, 65034310, 65034310, 65034310, 65034310, 65034310], [6503431]]
    print(x_multi, '#'*10)

    # 实际绘图代码与单类型直方图差异不大，只是增加了一个图例项
    # 在 ax.hist 函数中先指定图例 label 名称
    ax.hist(x_multi, n_bins, histtype='bar',label=['2013', '2020'])

    ax.set_title('2013 vs 2020 total count of record')

    # 通过 ax.legend 函数来添加图例
    ax.legend()

    plt.show()


def total_distance_compare():
    # 用来正常显示负号
    plt.rcParams['axes.unicode_minus']=False

    # 指定分组个数
    n_bins=1

    fig,ax=plt.subplots(figsize=(8,5))

    # 分别生成10000 ， 5000 ， 2000 个值
    # x_multi = [np.random.randn(n) for n in [10000, 5000]]
    x_multi = [[16999], [16991,16999],
        [12999,12999,129991,12993,12993,12993,12931, 12990], [12998,12997,12992]]
    print(x_multi, '#'*10)

    # 实际绘图代码与单类型直方图差异不大，只是增加了一个图例项
    # 在 ax.hist 函数中先指定图例 label 名称
    ax.hist(x_multi, n_bins, histtype='bar',label=['2013(>5miles)', '2020(>5miles)', '2013(<5miles)', '2020(<5miles)'])

    ax.set_title('2013 vs 2020 average-distance compare')

    # 通过 ax.legend 函数来添加图例
    ax.legend()

    plt.show()


if __name__ == "__main__":
    # total_count_compare()
    total_distance_compare()

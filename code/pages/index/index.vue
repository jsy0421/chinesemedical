<template>
	<view class="container">
		<Search></Search>

		<!-- 轮播 -->
		<template>
			<Show :banner='banner'></Show>
		</template>

		<!-- 中间菜单 -->
		<template>
			<SlideBar :menuList='menuList'></SlideBar>
		</template>

		<!-- 当季推荐中药 -->
		<view class="seckill-section m-t">
			<view class="tui-group-name">
				<text>当季推荐中药</text>
			</view>
			<Recommended :goodsList='goodsList'></Recommended>
		</view>

		<!-- 针灸tip -->
		<view class="tui-product-box tui-pb-20 tui-bg-white">
			<view class="tui-group-name">
				<text>针灸tips</text>
			</view>
			<Tips></Tips>
		</view>

		<!-- gif -->
		<image mode="widthFix" src="../../static/index/1.gif"
			style="background: transparent !important;width: 100%;padding-top: 20rpx;"></image>

		<!-- 中医新资讯 -->
		<view class="tui-product-box tui-pb-20 tui-bg-white">
			<view class="tui-group-name">
				<text>中医新资讯</text>
			</view>
			<News :news='news'></News>
		</view>
	</view>
</template>
<script>
	import Search from '../../component/index/Search.vue'
	import tuiIcon from "../../component/thorui/tui-icon/tui-icon.vue"
	import Show from '../../component/index/Show.vue'
	import SlideBar from '../../component/index/SlideBar.vue'
	import Recommended from '../../component/index/Recommended.vue'
	import Tips from '../../component/index/Tips.vue'
	import News from '../../component/index/News.vue'

	export default {
		components: {
			Search,
			tuiIcon,
			Show,
			SlideBar,
			Recommended,
			Tips,
			News
		},
		mounted() {
			this.fetchRecommendedData();
			this.fetchSlideBarData();
			this.fetchNewsData();
		},
		data() {
			return {
				menuList: [],
				goodsList: [],
				news: [],
				scrollTop: false,
				banner: [
					'/static/index/show/1.jpg',
					'/static/index/show/2.jpg',
					'/static/index/show/3.jpg',
					'/static/index/show/4.jpg',
					'/static/index/show/5.jpg',
				]
			}
		},
		onLoad() {
			//下拉刷新
			setTimeout(function() {
				console.log('start pulldown');
			}, 1000);
			uni.startPullDownRefresh();

			// 获取导航栏高度， 设置搜索框自动适应
			uni.getSystemInfo({
				success: (res) => {
					console.log(res.statusBarHeight)
				}
			})

		},
		onPageScroll: function(e) {
			// 监听滑动
			this.scrollTop = e.scrollTop > 200;
		},
		methods: {
			fetchRecommendedData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/recommended',
					data: {},
					method: 'GET',
					success: (res) => {
						console.log(res.data)
						_this.goodsList = res.data;
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			fetchSlideBarData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/slideBar',
					data: {},
					method: 'GET',
					success: (res) => {
						var array = res.data;
						var index = 0;
						var newArray = [];
						while (index < array.length) {
							newArray.push(array.slice(index, index += 4));
						}
						_this.menuList = newArray;
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			fetchNewsData: function() {
				var _this = this;
				uni.request({
					url: 'http://192.168.43.90:3333/news',
					data: {},
					method: 'GET',
					success: (res) => {
						_this.news = res.data;
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
		},
		onPullDownRefresh: function() {
			// 下拉刷新
			console.log('refresh');
			setTimeout(function() {
				uni.stopPullDownRefresh();
			}, 1000);
		},
	}
</script>

<style scoped lang="less">
	@import '../../component/css/index.css';
</style>

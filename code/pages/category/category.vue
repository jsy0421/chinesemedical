<template>
	<view class="content">
		<scroll-view scroll-y class="left-aside">
			<view v-for="item in categoryList" :key="item.cid" class="f-item b-b"
				:class="{active: item.cid === currentId}" @click="tabtap(item)">
				{{item.main_name}}
			</view>
		</scroll-view>
		<scroll-view scroll-with-animation scroll-y class="right-aside" @scroll="asideScroll"
			:scroll-top="tabScrollTop">
			<view v-for="(item,index) in slist" :key="index" class="s-list" :id="'main-'+index">
				<text class="s-item">{{item.next_name}}</text>
				<view class="t-list">
					<view @click="navToDetailPage(v.son_name)" class="t-item" v-for="(v,j) in item.info" :key="j">
						<image :src="v.imgurl" lazy-load="true"></image>
						<text>{{v.son_name}}</text>
					</view>
				</view>
			</view>
		</scroll-view>
	</view>
</template>

<script>
	import {
		categoryList
	} from '../../mock/datas/category.js'
	export default {
		data() {
			return {
				sizeCalcState: false,
				tabScrollTop: 0,
				currentId: 1,
				dataId: 1,
				infoId: 1,
				slist: [],
				categoryList:categoryList,
				str: "",
				strData: "",
				strInfo: ""
			}
		},
		onLoad() {
			this.loadData();
		},
		methods: {
			loadData() {
				this.categoryList.forEach(item => {
					item.data.forEach((k, i, ary) => {
						k.pid = item.cid
						this.slist.push(k)
					})
				})

			},
			//一级分类点击
			tabtap(item) {
				if (!this.sizeCalcState) {
					this.calcSize();
				}

				this.currentId = item.cid;
				let index = this.slist.findIndex(sitem => sitem.pid === item.cid);
				this.tabScrollTop = this.slist[index].top;
			},
			//右侧栏滚动
			asideScroll(e) {
				if (!this.sizeCalcState) {
					this.calcSize();
				}
				let scrollTop = e.detail.scrollTop;
				let tabs = this.slist.filter(item => item.top <= scrollTop).reverse();
				if (tabs.length > 0) {
					this.currentId = tabs[0].pid;
				}
			},
			//计算右侧栏每个tab的高度等信息
			calcSize() {

				let h = 0;
				this.slist.forEach((item, index) => {
					let view = uni.createSelectorQuery().select("#main-" + index);
					view.fields({
						size: true
					}, data => {
						item.top = h;
						h += data.height;
						item.bottom = h;
					}).exec();
				})
				this.sizeCalcState = true;
			},
			navToDetailPage(name) {
				uni.navigateTo({
					url:"../../pages/detail/medicalDetail?id="+name
				})
			}
		}
	}
</script>

<style lang='scss'>
	page,
	.content {
		height: 100%;
		background-color: #f8f8f8;
	}

	.content {
		display: flex;
	}

	.left-aside {
		flex-shrink: 0;
		width: 200upx;
		height: 100%;
		background-color: #fff;
	}

	.f-item {
		display: flex;
		align-items: center;
		justify-content: center;
		width: 100%;
		height: 100upx;
		font-size: 28upx;
		color: $font-color-base;
		position: relative;

		&.active {
			color: $base-color;
			background: #f8f8f8;

			&:before {
				content: '';
				position: absolute;
				left: 0;
				top: 50%;
				transform: translateY(-50%);
				height: 36upx;
				width: 8upx;
				background-color: $base-color;
				border-radius: 0 4px 4px 0;
				opacity: .8;
			}
		}
	}

	.right-aside {
		flex: 1;
		overflow: hidden;
		padding-left: 20upx;
	}

	.s-item {
		display: flex;
		align-items: center;
		height: 70upx;
		padding-top: 8upx;
		font-size: 28upx;
		font-weight: 600;
		color: $font-color-dark;
	}

	.t-list {
		display: flex;
		flex-wrap: wrap;
		width: 100%;
		background: #fff;
		padding-top: 12upx;

		&:after {
			content: '';
			flex: 99;
			height: 0;
		}
	}

	.t-item {
		flex-shrink: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		width: calc(100% / 2);
		font-size: 28upx;
		color: #666;
		padding-bottom: 20upx;

		image {
			width: 160upx;
			height: 160upx;
		}
	}
</style>

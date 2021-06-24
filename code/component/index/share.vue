<template>
	<view class="tui-operation">
		<view class="tui-operation-left tui-col-7">
			<view class="tui-btn-comment">发表你的评论...</view>
		</view>
		<view class="tui-operation-right tui-right-flex tui-col-5">
			<view class="tui-operation-item" hover-class="tui-opcity" :hover-stay-time="150">
				<tui-icon name="message" :size="30" color="#444"></tui-icon>
				<tui-badge absolute type="white_primary" :scaleRatio="0.7">501</tui-badge>
			</view>
			<view class="tui-operation-item" @tap="collection">
				<tui-icon :name="isCollection ? 'star-fill' : 'star'" :size="29"
					:color="isCollection ? '#5677fc' : '#444'"></tui-icon>
			</view>
			<view class="tui-operation-item" hover-class="tui-opcity" :hover-stay-time="150">
				<button open-type="share" class="tui-share-btn">
					<tui-icon name="share" :size="31" color="#444"></tui-icon>
				</button>
			</view>
		</view>
	</view>
</template>

<script>
	import tuiIcon from '../../component/thorui/tui-icon/tui-icon.vue';
	import tuiBadge from '../../component/thorui/tui-badge/tui-badge.vue';
	
	export default {
		components:{
			tuiIcon,
			tuiBadge
		},
		data(){
			return{
				isCollection: false,
			}
		},
		methods:{
			collection: function() {
				this.isCollection = !this.isCollection
			},
			
		}
		
	}
</script>

<style>
	.tui-operation {
		width: 100%;
		height: 100rpx;
		overflow: hidden;
		background: #fff;
		display: flex;
		align-items: center;
		justify-content: space-between;
		position: fixed;
		left: 0;
		bottom: 0;
		z-index: 99999;
		padding-bottom: env(safe-area-inset-bottom);
	}
	
	.tui-operation::before {
		content: '';
		position: absolute;
		top: 0;
		right: 0;
		left: 0;
		border-top: 1rpx solid #eaeef1;
		-webkit-transform: scaleY(0.5);
		transform: scaleY(0.5);
	}
	
	.tui-operation-left {
		display: flex;
		align-items: center;
	}
	
	.tui-col-7 {
		width: 58.33333333%;
	}
	
	.tui-btn-comment {
		height: 64rpx;
		width: 84%;
		background: #ededed;
		color: #999;
		border-radius: 8rpx;
		font-size: 28rpx;
		display: flex;
		align-items: center;
		padding-left: 20rpx;
		box-sizing: border-box;
		padding-top: 0;
		margin-left: 30rpx;
	}
	
	.tui-operation-right {
		height: 100rpx;
		box-sizing: border-box;
		padding-top: 0;
	}
	
	.tui-right-flex {
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	.tui-col-5 {
		width: 41.66666667%;
	}
	
	.tui-operation-item {
		flex: 1;
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
		position: relative;
	}
	
	.tui-share-btn {
		display: block;
		background: none;
		margin: 0;
		padding: 0;
	}
</style>

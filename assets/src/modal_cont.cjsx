
'use strict'

React = require 'react'
ReactDOM = require 'react-dom'

printf = require 'printf'
Masonry = require 'masonry-layout'

imgReady = (->
  list = []
  intervalId = null

  # 用来执行队列
  queue = ->
    for i in list.length
      if list[i].end then list.splice(i--,1) else list[i]()
    !list.length && stop()

  # 停止所有定时器队列
  stop = ->
    clearInterval(intervalId)
    intervalId = null

  (url, ready, error) ->
    onready = {}
    width = null
    height = null
    newWidth = null
    newHeight = null
    img = new Image();
    img.src = url;

    # 如果图片被缓存，则直接返回缓存数据
    if img.complete
      ready.call img
      return

    width = img.width
    height = img.height

    # 加载错误后的事件
    img.onerror = ->
      error && error.call(img)
      onready.end = true
      img = img.onload = img.onerror = null

    # 图片尺寸就绪
    onready = ->
      newWidth = img.width
      newHeight = img.height
      if newWidth != width || newHeight != height || newWidth * newHeight > 1024
        ready img
        onready.end = true

    onready()
    # 完全加载完毕的事件
    img.onload = ->
      # onload在定时器时间差范围内可能比onready快
      # 这里进行检查并保证onready优先执行
      !onready.end && onready()
      # IE gif动画会循环执行onload，置空onload即可
      img = img.onload = img.onerror = null


    # 加入队列中定期执行
    if !onready.end
      list.push onready
      # 无论何时只允许出现一个定时器，减少浏览器性能损耗
      if intervalId == null
        intervalId = setInterval(queue, 40)
)()

module.exports = React.createClass

  getInitialState: ->
    masonry: null
    body: []

  componentDidUpdate: ->
    this.state.masonry.reloadItems()
    this.state.masonry.layout()

  componentDidMount: ->
    grid = ReactDOM.findDOMNode this.refs.grid
    $(grid).bind 'contextmenu', (e) -> false
    this.state.masonry = new Masonry grid,
      itemSelector: '.grid-item'
      transitionDuration: 0
      # isAnimated: false
      # animationOptions:
      #   duration: 0
      #   easing: 'linear'
      #   queue: true

  initMasonry: ->
    return if this.state.body.length > 0
    grid = ReactDOM.findDOMNode this.refs.grid
    for i in [0..77]
      filename = printf "%05d.jpg", i
      imgReady "assets/img/gallery/#{this.props.collection}/#{filename}", ((that, img) ->
        that.state.body.push(
          src: img.src
          width: img.width
          height: img.height
        )
        that.state.masonry.addItems ReactDOM.findDOMNode that.refs["img#{i}"]
        that.forceUpdate()
      ).bind null, this

  render: ->
    body = []
    for img, idx in this.state.body
      body.push(
        <div key={idx} ref="img#{idx}" className="col-md-4 col-sm-6 grid-item">
          <img className="img-responsive" style={borderRadius: 3}
            src={img.src} width={img.width} height={img.height} alt="" />
        </div>
      )
    <div ref="grid">
      {body}
    </div>

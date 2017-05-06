
'use strict'

import React from 'react';
import ReactDOM from 'react-dom';
import printf from 'printf';
import Masonry from 'masonry-layout';

let imgReady = (function () {
  let list = [], intervalId = null,

  // 用来执行队列
  tick = function () {
    let i = 0;
    for (; i < list.length; i++) {
      list[i].end ? list.splice(i--, 1) : list[i]();
    };
    !list.length && stop();
  },

  // 停止所有定时器队列
  stop = function () {
    clearInterval(intervalId);
    intervalId = null;
  };

  return function (url, ready, load, error) {
    let onready, width, height, newWidth, newHeight,
      img = new Image();

    img.src = url;

    // 如果图片被缓存，则直接返回缓存数据
    if (img.complete) {
      ready(img);
      load && load.call(img);
      return;
    };

    width = img.width;
    height = img.height;

    // 加载错误后的事件
    img.onerror = function () {
      error && error.call(img);
      onready.end = true;
      img = img.onload = img.onerror = null;
    };

    // 图片尺寸就绪
    onready = function () {
      newWidth = img.width;
      newHeight = img.height;
      if (newWidth !== width || newHeight !== height ||
        // 如果图片已经在其他地方加载可使用面积检测
        newWidth * newHeight > 1024
      ) {
        ready(img);
        onready.end = true;
      };
    };
    onready();

    // 完全加载完毕的事件
    img.onload = function () {
      // onload在定时器时间差范围内可能比onready快
      // 这里进行检查并保证onready优先执行
      !onready.end && onready();

      load && load.call(img);

      // IE gif动画会循环执行onload，置空onload即可
      img = img.onload = img.onerror = null;
    };

    // 加入队列中定期执行
    if (!onready.end) {
      list.push(onready);
      // 无论何时只允许出现一个定时器，减少浏览器性能损耗
      if (intervalId === null) intervalId = setInterval(tick, 40);
    };
  };
})();

class Grid extends React.Component {

  constructor(props) {
      super(props);
      this.state = {
        masonry: null,
        body: []
      };
    }

  componentDidUpdate() {
    this.state.masonry.reloadItems();
    this.state.masonry.layout();
  }

  componentDidMount() {
    let grid = ReactDOM.findDOMNode(this.refs.grid);
    $(grid).bind('contextmenu', (e) => false);
    this.state.masonry = new Masonry(grid,
      {
        itemSelector: '.grid-item',
        transitionDuration: 0
      }
    );
  }

  initMasonry() {
    if (this.state.body.length > 0) return;
    let grid = ReactDOM.findDOMNode(this.refs.grid);
    for (let i = 0; i < 77; i++) {
      let filename = printf("%05d.jpg", i);
      imgReady("assets/img/gallery/" + this.props.collection + '/' + filename,
        ((that, img) => {
          that.state.body.push({
            src: img.src,
            width: img.width,
            height: img.height
          });
          that.state.masonry.addItems(ReactDOM.findDOMNode(that.refs["img"+i]));
          that.forceUpdate();
        }).bind(null, this)
      );
    }
  }

  render() {
    let body = [];
    for (let idx = 0; idx < this.state.body.length; idx++) {
      let img = this.state.body[idx];
      body.push(
        <div key={idx} ref={"img"+idx} className="col-md-4 col-sm-6 grid-item">
          <img className="img-responsive" style={{borderRadius: 3}}
            src={img.src} width={img.width} height={img.height} alt="" />
        </div>
      );
    }
    return (
      <div ref="grid">
        {body}
      </div>
    );
  }
}

export default Grid;

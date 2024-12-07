/*响应式布局 start*/
    function setRootFontSize() {
        var width = document.documentElement.clientWidth || document.body.clientWidth;
        if (width > 540) {
            width = 540;
        }
        fontSize = (width / 10);
        document.getElementsByTagName('html')[0].style['font-size'] = fontSize + 'px';
    }
    setRootFontSize();
    window.addEventListener('resize', function() {
        setRootFontSize();
    }, false);
/*响应式布局 end*/
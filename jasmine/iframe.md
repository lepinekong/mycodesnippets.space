
# Tips: jasmine in iframe with javascript closure


### ReAdABLE Source [(What is the ReAdABLE Human Format?)](http://readablehumanformat.com)

[http://mycodesnippets.space/html/iframe.red](https://github.com/lepinekong/mycodesnippets/blob/master/html/iframe.red)


### index.html

must reference myFrame.html snippet


```html

        <html>
        <iframe id="myIframe"  src="myFrame.html" width=100% height=600></iframe>
        <script>
            function iframeRef(frameRef) {
return frameRef.contentWindow;
            }
        </script>
        <script>
        function domUtils(context_document) {
            // instead of
            // this.document = context_document;
            // use closure
            var document;
            if (context_document == undefined) {
document = window.document;
            } else {
document = context_document
            }

            this.getElementById = function(id) {

var _id = id;
var _domElement = document.getElementById(_id);
if (_domElement == null) {
    alert("dom element name=" + _id + " does not exist in getElementById");
}
return document.getElementById(_id);
            }
        }
        </script>
        <script>
            iframe = document.getElementById("myIframe");
            iframeApp = iframeRef(iframe);
            var gTimer = 1;

            // ne marche pas : trop tôt
            // iframeDocument = iframeApp.document;


        </script>

        <script>


        function doSomething() {
            //iframeApp = iframeRef(iframe);
            iframeDocument = iframeApp.document;
            iframeApp.domUtils = domUtils;
            _domUtils = new iframeApp.domUtils(iframeDocument);
            var test = _domUtils.getElementById("test");
            alert(test.value);

        }

        if (navigator.userAgent.indexOf("MSIE") > -1 && !window.opera) {
            var oldonreadystatechange = iframe.onreadystatechange;
            iframe.onreadystatechange = function(){
if (iframe.readyState == "complete"){
    if (oldonreadystatechange != null) {
    oldonreadystatechange();
    setTimeout(doSomething,gTimer);
    }
}
            };
        } else {
            var oldonload = iframe.onload;
            iframe.onload = function(){
if (oldonload != null) {
    oldonload();
}
setTimeout(doSomething,gTimer);
            };
        }
        </script>



<body>
    <form action="">
        <input type="text" id="test" value="hello from parent">
    </form>

</body>
        </html>            
        
```



### myFrame.html

to be referenced in index.html


```html

<html>
<head>
    <title>myFrame</title>
</head>
<script>
function domUtils(document) {

    this.document = document;
    alert(this.document.getElementById("test"));

    this.getElementById = function(id) {

        var _id = id;
        var _domElement = this.document.getElementById(_id);
        if (_domElement == null) {
            alert("dom element name=" + _id + " does not exist in getElementById");
        }
        return this.document.getElementById(_id);
    }
}
</script>

<body>
    <form action="">
        <input type="text" id="test" value="hello">
        <input type="text" id="test2" value="hello2">        
    </form>
    <script>
    //var _domUtils = new domUtils(document);
    //var test = _domUtils.getElementById("test");
    //alert(test.value);
    </script>
</body>
</html>
        
```


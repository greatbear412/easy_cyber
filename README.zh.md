<p align="center">
    <a href="https://github.com/greatbear412/easy_cyber/blob/master/README.md">English</a>
    | <a href="https://github.com/greatbear412/easy_cyber/blob/master/README.zh.md">简体中文</a>
</p>

---

# easy_cyber
轻松为你的`widget`添加'Cyber punk'风格的效果.

## 预览
<img src="https://github.com/greatbear412/easy_cyber/raw/master/doc/example.gif">


## 用法
```
    class CyberExample extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                body: Container(
            child: Center(
                child: CyberPunk(
                child: Image(image: AssetImage('imgs/panda_cyber.webp')),
                dur: 500,
                cyberItemCount: 10,
                infinite: true,
                ),
            ),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
            ),
            ));
        }
    }
```
## 参数描述
|    **Param**         |                                **Description**         |          **Default**           |
| :------------------: | :----------------------------------------------------: | :----------------------------: |
|    dur               |      每一个动画效果bar的渐隐、渐显时间                      |              500               |
|    cyberItemCount    |      每次循环中生成的动画效果bar的数量                      |              10                |
|    cyberItemHeight   |      每个生成的动画效果bar的高度                           |              10                |
|    maxHeight         |      动画区域的高度                                       |              Widget's height   |
|    repeatTimes       |      动画重复次数                                         |              1                 |
|    infinite          |      是否无限循环（如果为`true`,则 `repeatTimes` 参数无效    |              false            |

## 说明
主要使用了`ClipPath` widget，最好的使用方式是与图片搭配。
原理并不复杂， 结果也并不完美，但好处是你可以轻松的改造它。
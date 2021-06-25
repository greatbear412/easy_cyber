<p align="center">
    <a href="https://github.com/greatbear412/easy_cyber/blob/master/README.md">English</a>
    | <a href="https://github.com/greatbear412/easy_cyber/blob/master/README.zh.md">简体中文</a>
</p>

---
# easy_cyber
An easy way to add "cyber punk" style animation to your widget.

## Preview
<img src="https://github.com/greatbear412/easy_cyber/raw/master/doc/example.gif">

## Usage
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
## Param Description
|    **Param**         |                                **Description**                                |          **Default**           |
| :------------------: | :---------------------------------------------------------------------------: | :----------------------------: |
|    dur               |      The max duration(milliseconds) of gradually showing/hiding animition     |              500               |
|    cyberItemCount    |      Count of each 'cyper' animation piece in a single animition circle       |              10                |
|    cyberItemHeight   |      Height of each 'cyper' animation piece.                                  |              10                |
|    maxHeight         |      Max height of animation zone.                                            |              Widget's height   |
|    repeatTimes       |      Animation repeat times.                                                  |              1                 |
|    infinite          |      If set to true, animition won't stop and `repeatTimes` won't work.       |              false             |

## Note
This package mainly uses `ClipPath` widget and best applied with images.
It's not perfect at all and easy to customize by yourself.

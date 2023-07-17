import QtQuick 2.0
import Toou2D 1.0
import "../pages"
import "../stores"
import "../actions"

TInputField{
    placeholderIcon.source: TAwesomeType.FA_search
    placeholderLabel.text: "type something"
    
    Keys.onReleased: {
        if(event.key === Qt.Key_Return)
            AppActions.searchKeyword(text)
    }
}

import QtQuick 2.0
import QuickFlux 1.1
import Toou2D 1.0
import "../actions"
import "../stores"
import "../pages"

Middleware {
    property var stack;

    filterFunctionEnabled: true
    
    function goTo(message){
        stack.push(message.item)
    }

    function goBack(message){
        stack.pop()
    }
}
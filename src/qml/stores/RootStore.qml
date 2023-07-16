import QtQuick 2.0
import QuickFlux 1.1

Store{
    property alias wizard: wizard
    WizardStore { id: wizard}
    
    property alias chassis: chassis
    ChassisStore {id: chassis}
}
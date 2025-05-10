# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

list(APPEND scrite_SRCS
    src/automation/automation.cpp src/automation/automation.h
    src/automation/automation_module.cpp
    src/automation/automationrecorder.cpp src/automation/automationrecorder.h
    src/automation/eventautomationstep.cpp src/automation/eventautomationstep.h
    src/automation/pausestep.cpp src/automation/pausestep.h
    src/automation/scriptautomationstep.cpp src/automation/scriptautomationstep.h
    src/automation/windowcapture.cpp src/automation/windowcapture.h
    src/core/application.cpp src/core/application.h
    src/core/application_build_timestamp.cpp
    src/core/appwindow.cpp src/core/appwindow.h
    src/core/autoupdate.cpp src/core/autoupdate.h
    src/core/filelocker.cpp src/core/filelocker.h
    src/core/localstorage.cpp src/core/localstorage.h
    src/core/pdfexportablegraphicsscene.cpp src/core/pdfexportablegraphicsscene.h
    src/core/peerapplookup.cpp src/core/peerapplookup.h
    src/core/printerobject.h
    src/core/qobjectlistmodel.cpp src/core/qobjectlistmodel.h
    src/core/qobjectproperty.cpp src/core/qobjectproperty.h
    src/core/scrite.cpp src/core/scrite.h
    src/core/systemtextinputmanager.cpp src/core/systemtextinputmanager.h
    src/document/attachments.cpp src/document/attachments.h
    src/document/characterrelationshipgraph.cpp src/document/characterrelationshipgraph.h
    src/document/documentfilesystem.cpp src/document/documentfilesystem.h
    src/document/form.cpp src/document/form.h
    src/document/formatting.cpp src/document/formatting.h
    src/document/notebookmodel.cpp src/document/notebookmodel.h
    src/document/notes.cpp src/document/notes.h
    src/document/scene.cpp src/document/scene.h
    src/document/screenplay.cpp src/document/screenplay.h
    src/document/screenplayadapter.cpp src/document/screenplayadapter.h
    src/document/screenplaytextdocument.cpp src/document/screenplaytextdocument.h
    src/document/screenplaytextdocumentoffsets.cpp src/document/screenplaytextdocumentoffsets.h
    src/document/scritedocument.cpp src/document/scritedocument.h
    src/document/scritedocumentvault.cpp src/document/scritedocumentvault.h
    src/document/scritefileinfo.cpp src/document/scritefileinfo.h
    src/document/scritefilelistmodel.cpp src/document/scritefilelistmodel.h
    src/document/structure.cpp src/document/structure.h
    src/document/transliteration.cpp src/document/transliteration.h
    src/document/undoredo.cpp src/document/undoredo.h
    src/exporters/characterrelationshipsgraphexporter.cpp src/exporters/characterrelationshipsgraphexporter.h src/exporters/characterrelationshipsgraphexporter_p.cpp src/exporters/characterrelationshipsgraphexporter_p.h
    src/exporters/finaldraftexporter.cpp src/exporters/finaldraftexporter.h
    src/exporters/fountainexporter.cpp src/exporters/fountainexporter.h
    src/exporters/htmlexporter.cpp src/exporters/htmlexporter.h
    src/exporters/odtexporter.cpp src/exporters/odtexporter.h
    src/exporters/pdfexporter.cpp src/exporters/pdfexporter.h
    src/exporters/structureexporter.cpp src/exporters/structureexporter.h src/exporters/structureexporter_p.cpp src/exporters/structureexporter_p.h
    src/exporters/textexporter.cpp src/exporters/textexporter.h
    src/importers/finaldraftimporter.cpp src/importers/finaldraftimporter.h
    src/importers/fountainimporter.cpp src/importers/fountainimporter.h
    src/importers/htmlimporter.cpp src/importers/htmlimporter.h
    src/importers/openfromlibrary.cpp src/importers/openfromlibrary.h
    src/interfaces/abstractdeviceio.cpp src/interfaces/abstractdeviceio.h
    src/interfaces/abstractexporter.cpp src/interfaces/abstractexporter.h
    src/interfaces/abstractimporter.cpp src/interfaces/abstractimporter.h
    src/interfaces/abstractreportgenerator.cpp src/interfaces/abstractreportgenerator.h
    src/interfaces/abstractscreenplaysubsetreport.cpp src/interfaces/abstractscreenplaysubsetreport.h
    src/interfaces/abstracttextdocumentexporter.cpp src/interfaces/abstracttextdocumentexporter.h
    src/network/networkaccessmanager.cpp src/network/networkaccessmanager.h
    src/network/restapicall.cpp src/network/restapicall.h
    src/network/user.cpp src/network/user.h
    src/printing/qtextdocumentpagedprinter.cpp src/printing/qtextdocumentpagedprinter.h
    src/quick/items/abstractshapeitem.cpp src/quick/items/abstractshapeitem.h
    src/quick/items/boundingboxevaluator.cpp src/quick/items/boundingboxevaluator.h
    src/quick/items/gridbackgrounditem.cpp src/quick/items/gridbackgrounditem.h
    src/quick/items/painterpathitem.cpp src/quick/items/painterpathitem.h
    src/quick/items/qimageitem.cpp src/quick/items/qimageitem.h
    src/quick/items/ruleritem.cpp src/quick/items/ruleritem.h
    src/quick/items/simpletabbaritem.cpp src/quick/items/simpletabbaritem.h
    src/quick/items/textdocumentitem.cpp src/quick/items/textdocumentitem.h
    src/quick/items/textshapeitem.cpp src/quick/items/textshapeitem.h
    src/quick/objects/aggregation.cpp src/quick/objects/aggregation.h
    src/quick/objects/announcement.cpp src/quick/objects/announcement.h
    src/quick/objects/basicfileiconprovider.cpp src/quick/objects/basicfileiconprovider.h
    src/quick/objects/basicfileinfo.cpp src/quick/objects/basicfileinfo.h
    src/quick/objects/batchchange.cpp src/quick/objects/batchchange.h
    src/quick/objects/clipboard.cpp src/quick/objects/clipboard.h
    src/quick/objects/colorimageprovider.cpp src/quick/objects/colorimageprovider.h
    src/quick/objects/completionmodel.cpp src/quick/objects/completionmodel.h
    src/quick/objects/contextmenuevent.cpp src/quick/objects/contextmenuevent.h
    src/quick/objects/delayedpropertybinder.cpp src/quick/objects/delayedpropertybinder.h
    src/quick/objects/deltadocument.cpp src/quick/objects/deltadocument.h
    src/quick/objects/errorreport.cpp src/quick/objects/errorreport.h
    src/quick/objects/eventfilter.cpp src/quick/objects/eventfilter.h
    src/quick/objects/filemanager.cpp src/quick/objects/filemanager.h
    src/quick/objects/flickscrollspeedcontrol.cpp src/quick/objects/flickscrollspeedcontrol.h
    src/quick/objects/focustracker.cpp src/quick/objects/focustracker.h
    src/quick/objects/itempositionmapper.cpp src/quick/objects/itempositionmapper.h
    src/quick/objects/modelaggregator.cpp src/quick/objects/modelaggregator.h
    src/quick/objects/notification.cpp src/quick/objects/notification.h
    src/quick/objects/notificationmanager.cpp src/quick/objects/notificationmanager.h
    src/quick/objects/polygontesselator.cpp src/quick/objects/polygontesselator.h
    src/quick/objects/propertyalias.cpp src/quick/objects/propertyalias.h
    src/quick/objects/refcounter.cpp src/quick/objects/refcounter.h
    src/quick/objects/resetonchange.cpp src/quick/objects/resetonchange.h
    src/quick/objects/searchengine.cpp src/quick/objects/searchengine.h
    src/quick/objects/shortcutsmodel.cpp src/quick/objects/shortcutsmodel.h
    src/quick/objects/standardpaths.cpp src/quick/objects/standardpaths.h
    src/quick/objects/syntaxhighlighter.cpp src/quick/objects/syntaxhighlighter.h
    src/quick/objects/tabsequencemanager.cpp src/quick/objects/tabsequencemanager.h
    src/quick/objects/textdocument.cpp src/quick/objects/textdocument.h
    src/quick/objects/textlimiter.cpp src/quick/objects/textlimiter.h
    src/quick/objects/trackobject.cpp src/quick/objects/trackobject.h
    src/reports/characterreport.cpp src/reports/characterreport.h
    src/reports/characterscreenplayreport.cpp src/reports/characterscreenplayreport.h
    src/reports/locationreport.cpp src/reports/locationreport.h
    src/reports/notebookreport.cpp src/reports/notebookreport.h
    src/reports/progressreport.cpp src/reports/progressreport.h
    src/reports/scenecharactermatrixreport.cpp src/reports/scenecharactermatrixreport.h
    src/reports/screenplaysubsetreport.cpp src/reports/screenplaysubsetreport.h
    src/reports/statisticsreport.cpp src/reports/statisticsreport.h src/reports/statisticsreport_p.cpp src/reports/statisticsreport_p.h
    src/utils/execlatertimer.cpp src/utils/execlatertimer.h
    src/utils/fountain.cpp src/utils/fountain.h
    src/utils/garbagecollector.cpp src/utils/garbagecollector.h
    src/utils/genericarraymodel.cpp src/utils/genericarraymodel.h
    src/utils/graphlayout.cpp src/utils/graphlayout.h
    src/utils/hourglass.h
    src/utils/modifiable.h
    src/utils/qobjectfactory.h
    src/utils/qobjectserializer.cpp src/utils/qobjectserializer.h
    src/utils/urlattributes.cpp src/utils/urlattributes.h
)

set(scrite_SRCS ${scrite_SRCS} PARENT_SCOPE)


# SPDX-FileCopyrightText: 2025 Julius Künzel <julius.kuenzel@kde.org>
# SPDX-License-Identifier: BSD-2-Clause

# Bengali

qt_add_resources(Scrite "scrite_bengali_font"
    PREFIX "/font/"
    FILES
        Bengali/HindSiliguri-Bold.ttf
        Bengali/HindSiliguri-Regular.ttf
)

# English

qt_add_resources(Scrite "scrite_english_font"
    PREFIX "/font/"
    FILES
        "English/CourierPrime-Bold.ttf"
        "English/CourierPrime-BoldItalic.ttf"
        "English/CourierPrime-Italic.ttf"
        "English/CourierPrime-Regular.ttf"
)

# Gujarati

qt_add_resources(Scrite "scrite_gujarati_font"
    PREFIX "/font/"
    FILES
    "Gujarati/HindVadodara-Bold.ttf"
    "Gujarati/HindVadodara-Regular.ttf"
)

# Hindi

qt_add_resources(Scrite "scrite_hindi_font"
    PREFIX "/font/"
    FILES
        "Hindi/Mukta-Bold.ttf"
        "Hindi/Mukta-Regular.ttf"
)

# Kannada

set(scrite_kannada_font_resource_files
    "Kannada/BalooTamma2-Bold.ttf"
    "Kannada/BalooTamma2-Regular.ttf"
)

qt_add_resources(Scrite "scrite_kannada_font"
    PREFIX "/font/"
    FILES
        ${scrite_kannada_font_resource_files}
)

# Malayalam

set(scrite_malayalam_font_resource_files
    "Malayalam/BalooChettan2-Bold.ttf"
    "Malayalam/BalooChettan2-Regular.ttf"
)

qt_add_resources(Scrite "scrite_malayalam_font"
    PREFIX "/font/"
    FILES
        ${scrite_malayalam_font_resource_files}
)

# Marathi

set(scrite_marathi_font_resource_files
    "Marathi/Shusha-Normal.ttf"
)

qt_add_resources(Scrite "scrite_marathi_font"
    PREFIX "/font/"
    FILES
        ${scrite_marathi_font_resource_files}
)

# Oriya

set(scrite_oriya_font_resource_files
    "Oriya/BalooBhaina2-Bold.ttf"
    "Oriya/BalooBhaina2-Regular.ttf"
)

qt_add_resources(Scrite "scrite_oriya_font"
    PREFIX "/font/"
    FILES
        ${scrite_oriya_font_resource_files}
)

# Punjabi

set(scrite_punjabi_font_resource_files
    "Punjabi/BalooPaaji2-Bold.ttf"
    "Punjabi/BalooPaaji2-Regular.ttf"
)

qt_add_resources(Scrite "scrite_punjabi_font"
    PREFIX "/font/"
    FILES
        ${scrite_punjabi_font_resource_files}
)

# Sanskrit

set(scrite_sanskrit_font_resource_files
    "Sanskrit/Mukta-Bold.ttf"
    "Sanskrit/Mukta-Regular.ttf"
)

qt_add_resources(Scrite "scrite_sanskrit_font"
    PREFIX "/font/"
    FILES
        ${scrite_sanskrit_font_resource_files}
)

# Tamil

qt_add_resources(Scrite "scrite_tamil_font"
    PREFIX "/font/"
    FILES
        "Tamil/HindMadurai-Bold.ttf"
        "Tamil/HindMadurai-Regular.ttf"
)

# Telugu

qt_add_resources(Scrite "scrite_telugu_font"
    PREFIX "/font/"
    FILES
        "Telugu/HindGuntur-Bold.ttf"
        "Telugu/HindGuntur-Regular.ttf"
)

# Rubik

qt_add_resources(Scrite "scrite_rubik_font"
    PREFIX "/font/"
    FILES
        "Rubik/Rubik-Bold.ttf"
        "Rubik/Rubik-BoldItalic.ttf"
        "Rubik/Rubik-Italic.ttf"
        "Rubik/Rubik-Regular.ttf"
)

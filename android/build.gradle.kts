allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    // Workaround for plugins that don't specify a namespace (required by AGP 8+).
    // This applies to isar_flutter_libs and other legacy plugins.
    project.pluginManager.withPlugin("com.android.library") {
        val android = project.extensions.getByName("android")
            as com.android.build.gradle.LibraryExtension
        if (android.namespace.isNullOrEmpty()) {
            val manifest = project.file("src/main/AndroidManifest.xml")
            if (manifest.exists()) {
                val packageName = javax.xml.parsers.DocumentBuilderFactory
                    .newInstance()
                    .newDocumentBuilder()
                    .parse(manifest)
                    .documentElement
                    .getAttribute("package")
                if (packageName.isNotEmpty()) {
                    android.namespace = packageName
                }
            }
        }
    }
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

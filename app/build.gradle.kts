plugins {
    application
}

repositories {
    mavenCentral()
}


val manifoldVersion = "2024.1.17"
val postgresVersion = "42.7.3"

dependencies {
    implementation("systems.manifold:manifold-sql-rt:$manifoldVersion")
    annotationProcessor("systems.manifold:manifold-sql:$manifoldVersion")
    testAnnotationProcessor("systems.manifold:manifold-sql:$manifoldVersion")

    implementation("org.postgresql:postgresql:$postgresVersion")
    annotationProcessor("org.postgresql:postgresql:$postgresVersion")
    testAnnotationProcessor("org.postgresql:postgresql:$postgresVersion")

    testImplementation(libs.junit.jupiter)
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
}

java {
    toolchain {
//        languageVersion = JavaLanguageVersion.of(21)
    }
}

application {
    mainClass = "org.example.App"
}

tasks.named<Test>("test") {
    useJUnitPlatform()
}

tasks.withType<JavaCompile>().configureEach {
    options.compilerArgs.addAll(
        listOf(
            "-Xplugin:Manifold",
        )
    )
}
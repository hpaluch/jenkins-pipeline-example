pipeline {
    agent {  label 'linux' }
    stages {
       stage('Main'){
            steps {
                sh "ls -lR"
                sh """
                set -u # fail on undefined variables
                cd hello-c
                make clean all
                MACHINE=\$(readelf -h hello | awk '/Machine:/{print \$NF}')
                EXP_MACHINE=X86-64
                echo "MACHINE='\$MACHINE', expected: '\$EXP_MACHINE'"
                [ "\$MACHINE" = "\$EXP_MACHINE" ] || {
                   echo "ERROR: file 'hello' has arch '\$MACHINE', but expected '\$EXP_MACHINE'"'!' >&2
                   exit 1
                }
                echo "OK: Build finished"
                """
            }
        }
    }
    post {
        always {
            echo "Running Post-Always handler..."
            echo "e-mail target '$NOTIFICATION_EMAIL'"
            step([$class: 'Mailer',
                notifyEveryUnstableBuild: true,
               recipients: "$NOTIFICATION_EMAIL",
               sendToIndividuals: false])
        }
    }
}

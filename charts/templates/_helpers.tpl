
{{- define "go-echobc137633-a63d-46b9-bde2-fbc6934f1729.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc137633-a63d-46b9-bde2-fbc6934f1729.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echobc137633-a63d-46b9-bde2-fbc6934f1729.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc137633-a63d-46b9-bde2-fbc6934f1729.labels" -}}
helm.sh/chart: {{ include "go-echobc137633-a63d-46b9-bde2-fbc6934f1729.chart" . }}
{{ include "go-echobc137633-a63d-46b9-bde2-fbc6934f1729.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc137633-a63d-46b9-bde2-fbc6934f1729.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc137633-a63d-46b9-bde2-fbc6934f1729.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echocd84b53f-77b3-40f2-8a4a-ab8d995604f1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd84b53f-77b3-40f2-8a4a-ab8d995604f1.fullname" -}}
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


{{- define "go-echocd84b53f-77b3-40f2-8a4a-ab8d995604f1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd84b53f-77b3-40f2-8a4a-ab8d995604f1.labels" -}}
helm.sh/chart: {{ include "go-echocd84b53f-77b3-40f2-8a4a-ab8d995604f1.chart" . }}
{{ include "go-echocd84b53f-77b3-40f2-8a4a-ab8d995604f1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd84b53f-77b3-40f2-8a4a-ab8d995604f1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd84b53f-77b3-40f2-8a4a-ab8d995604f1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
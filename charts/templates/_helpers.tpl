
{{- define "go-echocc096a27-92f6-41e2-90f7-c1b327bb470a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc096a27-92f6-41e2-90f7-c1b327bb470a.fullname" -}}
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


{{- define "go-echocc096a27-92f6-41e2-90f7-c1b327bb470a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc096a27-92f6-41e2-90f7-c1b327bb470a.labels" -}}
helm.sh/chart: {{ include "go-echocc096a27-92f6-41e2-90f7-c1b327bb470a.chart" . }}
{{ include "go-echocc096a27-92f6-41e2-90f7-c1b327bb470a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc096a27-92f6-41e2-90f7-c1b327bb470a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc096a27-92f6-41e2-90f7-c1b327bb470a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
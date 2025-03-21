
{{- define "go-echoeddab034-d051-49ed-9dd2-bf7f249688ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeddab034-d051-49ed-9dd2-bf7f249688ca.fullname" -}}
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


{{- define "go-echoeddab034-d051-49ed-9dd2-bf7f249688ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeddab034-d051-49ed-9dd2-bf7f249688ca.labels" -}}
helm.sh/chart: {{ include "go-echoeddab034-d051-49ed-9dd2-bf7f249688ca.chart" . }}
{{ include "go-echoeddab034-d051-49ed-9dd2-bf7f249688ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeddab034-d051-49ed-9dd2-bf7f249688ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeddab034-d051-49ed-9dd2-bf7f249688ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo4a590efe-f02b-4c80-925f-8b4216fadfbf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a590efe-f02b-4c80-925f-8b4216fadfbf.fullname" -}}
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


{{- define "go-echo4a590efe-f02b-4c80-925f-8b4216fadfbf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4a590efe-f02b-4c80-925f-8b4216fadfbf.labels" -}}
helm.sh/chart: {{ include "go-echo4a590efe-f02b-4c80-925f-8b4216fadfbf.chart" . }}
{{ include "go-echo4a590efe-f02b-4c80-925f-8b4216fadfbf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4a590efe-f02b-4c80-925f-8b4216fadfbf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4a590efe-f02b-4c80-925f-8b4216fadfbf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
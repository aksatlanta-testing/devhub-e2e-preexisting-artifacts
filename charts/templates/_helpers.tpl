
{{- define "go-echob79ca72f-b75f-484d-988c-26aea3a2edf9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob79ca72f-b75f-484d-988c-26aea3a2edf9.fullname" -}}
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


{{- define "go-echob79ca72f-b75f-484d-988c-26aea3a2edf9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob79ca72f-b75f-484d-988c-26aea3a2edf9.labels" -}}
helm.sh/chart: {{ include "go-echob79ca72f-b75f-484d-988c-26aea3a2edf9.chart" . }}
{{ include "go-echob79ca72f-b75f-484d-988c-26aea3a2edf9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob79ca72f-b75f-484d-988c-26aea3a2edf9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob79ca72f-b75f-484d-988c-26aea3a2edf9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
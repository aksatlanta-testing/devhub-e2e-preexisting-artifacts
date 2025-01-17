
{{- define "go-echod51e33d1-6260-4138-81a8-2c1ff9489232.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod51e33d1-6260-4138-81a8-2c1ff9489232.fullname" -}}
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


{{- define "go-echod51e33d1-6260-4138-81a8-2c1ff9489232.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod51e33d1-6260-4138-81a8-2c1ff9489232.labels" -}}
helm.sh/chart: {{ include "go-echod51e33d1-6260-4138-81a8-2c1ff9489232.chart" . }}
{{ include "go-echod51e33d1-6260-4138-81a8-2c1ff9489232.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod51e33d1-6260-4138-81a8-2c1ff9489232.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod51e33d1-6260-4138-81a8-2c1ff9489232.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
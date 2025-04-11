
{{- define "go-echod5851524-718f-4180-8f70-8dfd9e07fdd0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5851524-718f-4180-8f70-8dfd9e07fdd0.fullname" -}}
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


{{- define "go-echod5851524-718f-4180-8f70-8dfd9e07fdd0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5851524-718f-4180-8f70-8dfd9e07fdd0.labels" -}}
helm.sh/chart: {{ include "go-echod5851524-718f-4180-8f70-8dfd9e07fdd0.chart" . }}
{{ include "go-echod5851524-718f-4180-8f70-8dfd9e07fdd0.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5851524-718f-4180-8f70-8dfd9e07fdd0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5851524-718f-4180-8f70-8dfd9e07fdd0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
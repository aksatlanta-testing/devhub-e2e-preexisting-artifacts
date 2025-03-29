
{{- define "go-echob725ac2f-5daa-44fb-bb97-88a52065806e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob725ac2f-5daa-44fb-bb97-88a52065806e.fullname" -}}
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


{{- define "go-echob725ac2f-5daa-44fb-bb97-88a52065806e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob725ac2f-5daa-44fb-bb97-88a52065806e.labels" -}}
helm.sh/chart: {{ include "go-echob725ac2f-5daa-44fb-bb97-88a52065806e.chart" . }}
{{ include "go-echob725ac2f-5daa-44fb-bb97-88a52065806e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob725ac2f-5daa-44fb-bb97-88a52065806e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob725ac2f-5daa-44fb-bb97-88a52065806e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
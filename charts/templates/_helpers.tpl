
{{- define "go-echofaee2964-ae24-4b9b-bea2-58ac1cb9ac29.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofaee2964-ae24-4b9b-bea2-58ac1cb9ac29.fullname" -}}
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


{{- define "go-echofaee2964-ae24-4b9b-bea2-58ac1cb9ac29.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofaee2964-ae24-4b9b-bea2-58ac1cb9ac29.labels" -}}
helm.sh/chart: {{ include "go-echofaee2964-ae24-4b9b-bea2-58ac1cb9ac29.chart" . }}
{{ include "go-echofaee2964-ae24-4b9b-bea2-58ac1cb9ac29.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofaee2964-ae24-4b9b-bea2-58ac1cb9ac29.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofaee2964-ae24-4b9b-bea2-58ac1cb9ac29.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
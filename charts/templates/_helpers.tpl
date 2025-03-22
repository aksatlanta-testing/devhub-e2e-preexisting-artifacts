
{{- define "go-echocf145f1c-dcb3-4674-b791-7c1cae09d665.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf145f1c-dcb3-4674-b791-7c1cae09d665.fullname" -}}
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


{{- define "go-echocf145f1c-dcb3-4674-b791-7c1cae09d665.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf145f1c-dcb3-4674-b791-7c1cae09d665.labels" -}}
helm.sh/chart: {{ include "go-echocf145f1c-dcb3-4674-b791-7c1cae09d665.chart" . }}
{{ include "go-echocf145f1c-dcb3-4674-b791-7c1cae09d665.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf145f1c-dcb3-4674-b791-7c1cae09d665.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf145f1c-dcb3-4674-b791-7c1cae09d665.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
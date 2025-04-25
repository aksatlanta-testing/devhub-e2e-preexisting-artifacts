
{{- define "go-echod76f89bb-a81a-442f-b1ca-10dee0526c5c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod76f89bb-a81a-442f-b1ca-10dee0526c5c.fullname" -}}
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


{{- define "go-echod76f89bb-a81a-442f-b1ca-10dee0526c5c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod76f89bb-a81a-442f-b1ca-10dee0526c5c.labels" -}}
helm.sh/chart: {{ include "go-echod76f89bb-a81a-442f-b1ca-10dee0526c5c.chart" . }}
{{ include "go-echod76f89bb-a81a-442f-b1ca-10dee0526c5c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod76f89bb-a81a-442f-b1ca-10dee0526c5c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod76f89bb-a81a-442f-b1ca-10dee0526c5c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
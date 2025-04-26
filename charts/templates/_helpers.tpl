
{{- define "go-echocb561cc2-bd4d-4243-b73e-26ac934e01cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb561cc2-bd4d-4243-b73e-26ac934e01cc.fullname" -}}
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


{{- define "go-echocb561cc2-bd4d-4243-b73e-26ac934e01cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb561cc2-bd4d-4243-b73e-26ac934e01cc.labels" -}}
helm.sh/chart: {{ include "go-echocb561cc2-bd4d-4243-b73e-26ac934e01cc.chart" . }}
{{ include "go-echocb561cc2-bd4d-4243-b73e-26ac934e01cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb561cc2-bd4d-4243-b73e-26ac934e01cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb561cc2-bd4d-4243-b73e-26ac934e01cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}